include Rails.application.routes.url_helpers

class UserDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to

  def view_columns
    @view_columns ||= {
      user_name: { source: "User.user_name" },
      email:     { source: "User.email" },
      approved:  { source: "User.approved", searchable: false },
      editor:    { source: "User.is_editor", searchable: false },
      actions:   { source: "User.id", orderable: false, cond: :eq }
    }
  end

  def data
    records.map do |record|
      {
        user_name: link_to(record.user_name, admin_user_path(record)),
        email:     record.email,
        approved:  record.approved? ? '<i class="far fa-check"></i>'.html_safe : '',
        editor:    record.is_editor ? '<i class="far fa-check"></i>'.html_safe : '',
        actions:   link_to('<i class="far fa-edit"></i>'.html_safe, edit_admin_user_path(record), class: "action-icon")
      }
    end
  end

  private

  def get_raw_records
    User.all
  end

end