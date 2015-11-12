module ApplicationHelper
  def edit_button(edit_route)
    link_to "<i class='fa fa-pencil'></i> Modify".html_safe, edit_route, class: "btn btn-primary"
  end

  def delete_button(delete_route)
    link_to "<i class='fa fa-trash-o'></i> Delete".html_safe, delete_route,
      method: :delete, data: { confirm: "Are you sure you want to delete this?"}, class: "btn btn-danger"
  end
end
