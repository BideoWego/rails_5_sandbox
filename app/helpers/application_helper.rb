module ApplicationHelper
  def foobar_helper_method
    "I'm just some text in a helper method"
  end


  def flash_style(key)
    str = %Q; style="color:;
    color = {
      'success' => 'green',
      'notice' => 'green',
      'error' => 'red',
      'danger' => 'red',
      'alert' => 'red'
    }[key]
    color ||= 'blue'
    str += %Q;#{color}";
    str.html_safe
  end
end
