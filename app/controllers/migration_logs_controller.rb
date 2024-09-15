# app/controllers/migration_logs_controller.rb
class MigrationLogsController < ApplicationController
  def index
    @migration_logs = MigrationLog.all.order(migration_date: :desc)
  end
end
