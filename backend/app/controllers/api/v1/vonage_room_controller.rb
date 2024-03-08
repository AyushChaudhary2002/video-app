class Api::V1::VonageRoomController < ApplicationController
    def create
        @client = Vonage.client
        user = params[:user_name]
        uuid = SecureRandom.uuid
        session_id = create_session
        token = generate_token(session_id: session_id, name: user)
        meeting_info = MeetingInfo.new(
                        uuid: uuid,
                        session_id: session_id,
                        token: token
                    )
        if meeting_info.save
            render json: { meetingId: uuid }, status: :ok
        else
        error_message = "Error saving record: #{meeting_info.errors.full_messages.join(', ')}"
        render json: { error: error_message }, status: :unprocessable_entity
        end         
    end

    def join_room
        meeting_id = params[:meeting_id]
        meeting_info = MeetingInfo.find_by(uuid: meeting_id)
        if meeting_info
            render json: { clientSessionId: meeting_info.session_id, clientToken: meeting_info.token}, status: :ok
        else
            error_message = "Error saving record: #{meeting_info.errors.full_messages.join(', ')}"
            render json: { error: error_message }, status: :unprocessable_entity
        end
    end
      
    private
    def create_session
        session = @client.video.create_session(type: 'routed')
        session_id = session.session_id
    end

    def generate_token (session_id: , name: 'temp-name')
        token = @client.video.generate_client_token(
            session_id:,
            role: 'publisher',
            expire_time: Time.now.to_i+ (24 * 60 * 60), 
            data: "name=#{name}",
            initial_layout_class_list: ['focus', 'inactive']
        )
    end
end
