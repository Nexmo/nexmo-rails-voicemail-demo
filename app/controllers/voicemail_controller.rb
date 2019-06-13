class VoicemailController < ApplicationController
    skip_before_action :verify_authenticity_token

    NEXMO_NUMBER = 972526283474
    EXTERNAL_URL = 'http://bengreenberg.ngrok.io'
    
    def index
        @recordings = Recording.all
    end

    def answer
        render json:
        [
            {
                :action => 'talk',
                :text => 'Leave your message after the beep.'
            },
            {
                :action => 'record',
                :beepStart => true,
                :eventUrl => [ "#{EXTERNAL_URL}/recording" ],
                :endOnSilence => 3
            }
        ]
    end

    def event
        if params['status'] == 'answered'
            Recording.create(uuid: params['conversation_uuid'], from: params['from'])
        end
    end

    def new
        if params['recording_url']
            recording = Recording.find_by(uuid: params['conversation_uuid'])
            recording.recording_uuid = params['recording_uuid']
            recording.save
            Nexmo.files.save(params['recording_url'], "public/voicemail/#{params['recording_uuid']}.wav")
        end
    end
end
