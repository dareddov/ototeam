class AttendancesEmail
  deldegate :attendances, to: :@controller

  def initialize(controller)
    @controller = controller
  end

  def save
    if attendances.save
      attendances_send_email
    end
  end

  private

  def attendances_send_email
    AttendacesEmail.event_mail(User.self).deliver
  end

end



