class JobDetailMailer < ApplicationMailer
  def rejection_email(employee)
    @employee = employee
    mail(to: "amvyas@bestpeers.com", subject: 'Job Application Rejected',from: "kuldeeplovanshi777@gmail")
  end

  def acceptance_email(employee)
    @employee = employee
    mail(to: employee.email, subject: 'Job Application Accepted')
  end

end
