module Cucumber::StepMethods
  alias_method :Cuando, :When
end

Cuando /^visito (.+)$/i do |pagina|
  visit case unquoted = unquote(pagina)
  when /su p[áa]gina$/i, /su portada$/i:
    last_resource_url
  else
    unquoted.to_url
  end
end

Cuando /^(?:pulso|pincho) (?:en )?el bot[oó]n (.+)$/i do |boton|
  click_button(unquote(boton))
end

Cuando /^(?:pulso|pincho) (?:en )?el (enlace|enlace ajax|enlace con efectos) (.+)$/i do |tipo, enlace|
  options = {}
  options[:wait] = case tipo.downcase
  when 'enlace con efectos' then :effects
  when 'enlace ajax' then :ajax
  else :page
  end
  click_link(unquote(enlace), options)
end

Cuando /^(?:completo|relleno) (.+) con (?:el valor )?["'](.+)["']$/i do |campo, valor|
  fill_in unquote(campo), :with => valor
end

Cuando /^elijo (?:la|el)? ?(.+)$/i do |campo|
  chooses(unquote(campo).downcase.to_underscored)
end

Cuando /^marco (?:la|el)? ?(.+)$/i do |campo|
  checks(unquote(campo).to_underscored)
end

Cuando /^desmarco (?:la|el)? ?(.+)$/i do |campo|
  unchecks(unquote(campo).to_underscored)
end

Cuando /^adjunto el fichero ['"](.*)['"] (?:a|en) (.*)$/ do |ruta, campo|
  attach_file(unquote(campo), ruta.to_local_path)
end

Cuando /^selecciono ["'](.+?)["'](?: en (?:el listado de )?(.+))?$/i do |valor, campo|
# Ejemplo: Cuando selecciono 'Andorra' en 'País' (<select name="País">)
# Otros:
#   Cuando selecciono "Fontanero" en el listado de Profesiones
  unless campo.nil? || (field = campo.to_unquoted.to_field)
    raise MundoPepino::FieldNotMapped.new(campo.to_unquoted) 
  end
  selects(valor, :from => field)
end


## Use this step in conjunction with Rail's datetime_select helper. For example:
## When I select "December 25, 2008 10:00" as the date and time
#When /^I select "(.*)" as the date and time$/ do |time|
#  select_datetime(time)
#end
#
## Use this step when using multiple datetime_select helpers on a page or
## you want to specify which datetime to select. Given the following view:
##   <%= f.label :preferred %><br />
##   <%= f.datetime_select :preferred %>
##   <%= f.label :alternative %><br />
##   <%= f.datetime_select :alternative %>
## The following steps would fill out the form:
## When I select "November 23, 2004 11:20" as the "Preferred" data and time
## And I select "November 25, 2004 10:30" as the "Alternative" data and time
#When /^I select "(.*)" as the "(.*)" date and time$/ do |datetime, datetime_label|
#  select_datetime(datetime, :from => datetime_label)
#end
#
## Use this step in conjuction with Rail's time_select helper. For example:
## When I select "2:20PM" as the time
## Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
## will convert the 2:20PM to 14:20 and then select it.
#When /^I select "(.*)" as the time$/ do |time|
#  select_time(time)
#end
#
## Use this step when using multiple time_select helpers on a page or you want to
## specify the name of the time on the form.  For example:
## When I select "7:30AM" as the "Gym" time
#When /^I select "(.*)" as the "(.*)" time$/ do |time, time_label|
#  select_time(time, :from => time_label)
#end
#
## Use this step in conjuction with Rail's date_select helper.  For example:
## When I select "February 20, 1981" as the date
#When /^I select "(.*)" as the date$/ do |date|
#  select_date(date)
#end
#
## Use this step when using multiple date_select helpers on one page or
## you want to specify the name of the date on the form. For example:
## When I select "April 26, 1982" as the "Date of Birth" date
#When /^I select "(.*)" as the "(.*)" date$/ do |date, date_label|
#  select_date(date, :from => date_label)
#end
                                 
