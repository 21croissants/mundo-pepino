# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'
Cucumber::Rails.use_transactional_fixtures

require 'webrat/rails'

# Comment out the next two lines if you're not using RSpec's matchers (should / should_not) in your steps.
require 'cucumber/rails/rspec'
require 'webrat/rspec-rails'

require 'mundo_pepino'

MundoPepino::ModelsToClean = [
  # MODELOS PARA LIMPIAR antes de cada escenario,
  # por ejemplo:
  # Orchard, Terrace, Crop...
]

String.model_mappings = {
  # TRADUCCIÓN DE MODELOS AQUÍ, por ejemplo:
  # /^huert[oa]s?/i            => Orchard,
  # /^bancal(es)?$/i           => Terrace,
  # /^cultivos?$/i             => Crop...
}

String.field_mappings = {
  # TRADUCCIÓN DE CAMPOS AQUÍ:
  # /^[Ááa]reas?$/i    => 'area',
  # /^color(es)?$/i   => 'color',
  # /^latitud(es)?$/i => 'latitude',
  # /^longitud(es)?/i => 'length'
  #
  # TRADUCCIÓN ESPECÍFICA PARA UN MODELO
  # /^Orchard::longitud(es)?$/   => 'longitude'
}

class MiMundo < MundoPepino
  # Helpers específicos de nuestras features
  # include FixtureReplacement
end

Before do
  MundoPepino::ModelsToClean.each { |model| model.destroy_all }
end

World do
  MiMundo.new
end

