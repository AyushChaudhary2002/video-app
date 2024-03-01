class Api::V1::VonageRoomController < ApplicationController
    def create
        @client = Vonage.client
        user = params[:user_name]
        session_id = create_session
        token = generate_token(session_id: session_id, name: user)
        render json: {clientSessionId: session_id, clientToken: token}
    end

    def join_room
        begin
            @client = Vonage.client
            session_id = vonage_room_params[:session_id]
            user = params[:user_name]

            token = generate_token(session_id: session_id, name: user)
      
            render json: { token: token }, status: :ok
        rescue StandardError => e
            render json: { error: e.message }, status: :unprocessable_entity
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
    def vonage_room_params
        params.permit(:session_id, :user_name)
    end
end
