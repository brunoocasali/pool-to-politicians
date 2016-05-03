module ApplicationHelper
 def active_class(name)
   controller_name.eql?(name) || current_page?(name) ? 'active' : ''
 end
end
