# encoding: utf-8
# Este módulo se ha creado para describir
# dististintas metodologías de programación
# haciendo uso del Lenguaje de Programación
# Ruby.
#
# Author::    Richard Morales Luis (alu0100909678@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby

module Alimento

  # Esta clase se ha creado para representar un alimento y sus valores energéticos.
  # Se ha incluido el mixin Comparable.
  class Alimento

    attr_reader :name, :proteinas, :glucidos, :lipidos, :valor_energetico, :ig
    include Comparable

    # Se asignan los parámetros nombre, proteinas, glucidos y lipidos del alimento.
    def initialize(name, prot, gluc, lip)
      @name = name
      @proteinas = prot
      @glucidos = gluc
      @lipidos = lip
      @valor_energetico
      @ig
    end

    # Se muestran el alimento formateado.
    def to_s
      out = ""
      out = @name << " - "
      out << "Proteinas " << @proteinas.to_s << " - "
      out << "Glucidos " << @glucidos.to_s << " - "
      out << "Lipidos " << @lipidos.to_s << " - "
      calcular_v_energetico
      out << "Valor energético " << @valor_energetico.to_s << "."
      out
    end

    # Calcula el vaalor energético de cada alimento.
    def calcular_v_energetico
      @valor_energetico = (@glucidos*4)+(@proteinas*4)+(@lipidos*9)
      @valor_energetico
    end

    # Calcula el valor del indice glucémico mediante programacion funcional.
    def indice_glucemico(alimento, glucosa)

       ind = [],[]
       al = []
       gl = []
       alimento.each_with_index do |val, index|
         alimento[index].each_with_index{|val,index2| ind[index] << index2 }
       end

       ind.each_with_index do |valor,i| #quitamos el valor 0 del indice.
         ind[i] = valor.select{|val| val > 0}
       end

       al = [],[]
       gl = [],[]
       alsum = [],[]
       glsum = [],[]
       r = [],[]
       s = [],[]
       ind.each_with_index do |val, index|
         val.collect do |index2|
            al[index] << ((alimento[index][index2] - alimento[index][0]) + (alimento[index][index2-1] - alimento[index][0]))*2.5
            gl[index] << ((glucosa[index][index2] - glucosa[index][0]) + (glucosa[index][index2-1] - glucosa[index][0]))*2.5
        end
            alsum[index] = al[index].reduce(:+)
            glsum[index] = gl[index].reduce(:+)
       end
       r = alsum.zip(glsum)
       alsum.each_with_index{|val,index| s[index] = r[index].reduce(:/)*100}
       @indice_glucemico = s.reduce(:+)/2
    end

    # Funcion <=> del módulo Comparable.
    def <=>(other)
      return nil unless other.instance_of? Alimento
      @valor_energetico <=> other.valor_energetico
    end
  end

  #Clase derivada - Grupo Alimento.
  class GAlimento < Alimento
    attr_reader :group_name

    def initialize(name, prot, gluc, lip, name_group)
      super(name, prot, gluc, lip)
      @group_name = name_group
    end

    def to_s
      out = ""
      out << @group_name.to_s << " - "
      out << super.to_s
      out
    end
  end
end
