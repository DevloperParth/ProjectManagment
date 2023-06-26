class JobApplicationMailer < ApplicationMailer
  def application_accepted(employee, job_application, employer)
    @employee = employee
    @job_application = job_application
    @employer = employer
    mail(to: @employee.email, subject: 'Job Application Accepted')
  end

  def application_rejected(employee, job_application, employer)
    @employee = employee
    @job_application = job_application
    @employer = employer
    mail(to: @employee.email, subject: 'Job Application Rejected')
  end
end
