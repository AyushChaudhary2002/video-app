class Api::V1::VonageRoomController < ApplicationController
    def create
        debugger
        @client = Vonage.client
        user = params[:user]
        session_id = create_session
        token = generate_token(session_id: session_id, name: user)
        render json: {ClientSessionId: session_id, clientToken: token}
    end
    private
    def create_session
        session = @client.video.create_session(type: 'routed')
        session_id = session.session_id
    end

    def generate_token (session_id: , name: 'temp-name')
        token = @client.video.generate_client_token(
            session_id: session_id,
            role: 'moderator',
            expire_time: Time.now.to_i+ (24 * 60 * 60), 
            data: "name=#{name}",
            initial_layout_class_list: ['focus', 'inactive']
        )
    end
end
