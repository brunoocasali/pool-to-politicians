$("#content").empty().append("<%= escape_javascript(render(partial: 'preview_email')) %>");
