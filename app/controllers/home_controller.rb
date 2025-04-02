class HomeController < ApplicationController
  def index
    @random_gato = Gato.all.sample
    @featured_gatos = Gato.all.sample(3)
  end
end
