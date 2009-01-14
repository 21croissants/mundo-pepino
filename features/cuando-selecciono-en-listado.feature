Característica: selecciono en un listado

  Escenario: Selecciono una opción de una lista (*select*) 
  ########################################################################
  # Patrón:
  #   Cuando selecciono "_valor_"
  # o:
  #   Cuando selecciono "_valor_" en (el listado de) _campo_
  #
  # Ejemplos:
  #   Cuando selecciono "Hortalizas" en el listado de "Tipos de cultivo"
  #   Cuando selecciono 'Frutales'
  #
  ########################################################################
    Cuando visito la portada
         Y selecciono "Hortalizas" en el listado de "Tipos de cultivo"
         Y pulso el botón "Galleta de la fortuna"
    Entonces veo el tag div#orchard_type con el valor "Hortalizas"

    Cuando visito la portada
         Y selecciono 'Frutales' en Tipos de Cultivo
         Y pulso el botón "Galleta de la fortuna"
    Entonces veo el tag div#orchard_type con el valor "Frutales"

    Cuando visito la portada
         Y selecciono 'Hortalizas'
         Y pulso el botón "Galleta de la fortuna"
    Entonces veo el tag div#orchard_type con el valor "Hortalizas"

  Escenario: Selecciono una opción de una lista (desde Given) 
    Dado que visito la portada
       Y que selecciono 'Hortalizas'
    Cuando pulso el botón "Galleta de la fortuna"
    Entonces veo el tag div#orchard_type con el valor "Hortalizas"

  Escenario: Selecciono una fecha y hora sin indicar un campo específico
  ########################################################################
  # Patrón:
  #   Cuando selecciono "_dia_ de _mes_ de _año_, _hh_:_mm_" como fecha y hora
  #
  # Descripción:
  #   Selecciona fecha y hora en las listas de selección de fecha generadas 
  # con el helper datetime_select de Rails
  #
  #   Está pensado para aquellos casos en los que sólo tenemos una fecha en
  # en el formulario y no queremos mencionar a cual de las fechas existentes
  # nos referimos (porque sólo hay una).
  #   
  #   Las comillas para la fecha y la hora son opcionales.
  #
  # Ejemplo:
  #
  #   Cuando selecciono "25 de diciembre de 2008, 10:00" como fecha y hora
  #
  ########################################################################
    Cuando visito la portada
         Y selecciono "25 de diciembre de 2008, 10:00" como fecha y hora
         Y pulso el botón "Galleta de la fortuna"
    Entonces veo el tag div#fechayhora con el valor "25/12/2008-10:00"
    Cuando visito la portada
         Y selecciono 1 de setiembre de 1998, 12:46" como fecha y hora
         Y pulso el botón "Galleta de la fortuna"
    Entonces veo el tag div#fechayhora con el valor "1/9/1998-12:46"

  Escenario: Selecciono una fecha y hora en un campo concreto
  ########################################################################
  # Patrón:
  #   Cuando selecciono "_d_ de _m_ de _a_, _h_:_m_" como fecha y hora de? "_label_"
  #
  # Descripción:
  #   Selecciona fecha y hora en las listas de selección de una fecha generada 
  # con el helper datetime_select y etiquetada como _label_.
  #
  #   Podemos hacer referencia a una fecha con una etiqueta concreta cuando 
  # utilicemos varios datetime_select en una página (o si queremos simplemente 
  # escecificar en el texto a cual nos referimos). Por ejemplo, dada la 
  # siguiente vista:
  #
  #   <%= f.label :preferred, 'Preferida' %><br />
  #   <%= f.datetime_select :preferred %>
  #   <%= f.label :alternative, 'Alternativa' %><br />
  #   <%= f.datetime_select :alternative %>
  #
  # Los siguientes pasos seleccionarían dichas fechas en el formulario:
  #
  #   Cuando selecciono 23 de mayo de 1997, 11:20 como fecha y hora "Preferida"
  #   Y selecciono "1 de abril de 2004, 10:30" como fecha y hora "Alternativa"
  #   
  #   Las comillas para la fecha y la hora son opcionales. 
  #
  # Ejemplo:
  #   Cuando selecciono 5 de enero de 2008, 10:00 como fecha y hora "Preferida"
  #   Cuando selecciono 1 de abril de 2008, 10:00 como fecha y hora de "cosechado""
  #
  ########################################################################
    Cuando visito la portada
         Y selecciono "23 de noviembre de 2004, 11:20" como fecha y hora "Preferida"
         Y selecciono 25 de enero de 2005, 10:30 como fecha y hora de "Alternativa"
         Y pulso el botón "Galleta de la fortuna"
    Entonces veo el tag div#preferida con el valor "23/11/2004-11:20"
           Y veo el tag div#alternativa con el valor "25/1/2005-10:30"