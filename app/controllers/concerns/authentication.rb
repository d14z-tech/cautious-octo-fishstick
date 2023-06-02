module Authentication
  private
    def authenticate!
      if authenticated_user = User.find_by(token: request.headers['Authorization'])
        Current.user = authenticated_user
      else
        render json: { status: 'error', message: 'Unauthorized' }, status: :unauthorized
      end
    end
end