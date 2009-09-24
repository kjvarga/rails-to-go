begin
  ExceptionNotifier.sender_address =  %("error@#{SiteDefaults.HOST}")
  ExceptionNotifier.exception_recipients = [SiteDefaults.ADMIN_EMAIL]
  ExceptionNotifier.email_prefix = "[#{SiteDefaults.NAME}] "
rescue
end