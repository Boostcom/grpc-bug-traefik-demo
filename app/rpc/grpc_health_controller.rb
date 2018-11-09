# frozen_string_literal: true
require_relative '../../lib/health_services_pb'

class GrpcHealthController < ::Gruf::Controllers::Base
  bind GrpcBugDemo::Health::Service

  def check
    GrpcBugDemo::HealthCheckResponse.new(status: :SERVING)
  end

  def check_failure
    fail!(:unauthorized)
  end
end
