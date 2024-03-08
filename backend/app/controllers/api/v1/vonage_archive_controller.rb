class Api::V1::VonageArchiveController < ApplicationController
    def start
        @client = Vonage.client
        meeting_id = params[:meeting_id]
        meeting_info = MeetingInfo.find_by(uuid: meeting_id)
        response = @client.video.archives.start(session_id: meeting_info.session_id)
        if response
            render json: { archiveId: response.id }
          else
            render json: { error: 'Failed to start archive' }, status: :unprocessable_entity
          end
    end

    def stop
        @client = Vonage.client
        archive_id = params[:archive_id]
        response =  @client.video.archives.stop(archive_id: archive_id)
        if response
            render json: { response: response }
        else
            render json: { error: 'Failed to stop archive' }, status: :unprocessable_entity
        end
    end
end