require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user, roles: [ 'admin' ])
  end

  test 'should get logs' do
    sign_in @user
    get logs_url
    assert_response :success
  end

  test 'should get the ajax list' do
    sign_in @user
    create(:log)
    get logs_path, as: :json, params: ajax_request_params
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal 1, json['recordsTotal']
    assert_equal 1, json['recordsFiltered']
    assert_equal 1, json['data'].count
  end

  private

  def ajax_request_params(params = {})
    ActionController::Parameters.new({
      draw: '1',
      columns: {
         0 => { data: :severity, name: '', searchable: 'false', orderable: 'false', search: { value: '', regex: 'false' }},
         1 => { data: :message, name: '', searchable: 'true', orderable: 'true', search: { value: '', regex: 'false' }},
         2 => { data: :category, name: '', searchable: 'true', orderable: 'true', search: { value: '', regex: 'false' }},
      },
      order: {
        0 => { column: params.fetch(:column, 1).to_s, dir: params.fetch(:dir, :desc).to_s }
      },
      start: '0',
      length: params.fetch(:length, 10),
      search: { value: params.fetch(:filter, '').to_s, regex: 'false' },
      controller: :logs,
      action: :index,
      format: :json
    })
  end
end
