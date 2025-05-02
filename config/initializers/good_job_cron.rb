GOOD_JOB_CRON = {
  good_job_queue_monitor: {
    cron: '0 0 * * *',
    class: 'DeliveryOrdersJob',
  },
}.freeze

Rails.application.configure do
  config.good_job.enable_cron = true
  config.good_job.cron = GOOD_JOB_CRON
end
