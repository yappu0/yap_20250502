ActiveSupport.on_load(:action_mailer) do
  # メール送信サービスの障害でメールが失われると困るので、送信できるまでリトライする
  # SEE: https://github.com/bensheldon/good_job#actionmailer-retries
  ActionMailer::MailDeliveryJob.retry_on StandardError, wait: :polynomially_longer, attempts: :unlimited
end

Rails.application.configure do
  config.good_job.execution_mode = :external # NOTE: 開発環境でも本番と挙動を揃える
end
