class VoicemailController < ApplicationController
    skip_before_action :verify_authenticity_token

    NEXMO_NUMBER = 'YOUR NEXMO VIRTUAL PHONE NUMBER HERE'
    EXTERNAL_URL = 'http://YOUR NGROK URL HERE'
    
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
