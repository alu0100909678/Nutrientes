#Richard Morales Luis.

module Alimento
  class Alimento

    attr_reader :name, :proteinas, :glucidos, :lipidos, :valor_energetico
    include Comparable

    def initialize(name, prot, gluc, lip)
      @name = name
      @proteinas = prot
      @glucidos = gluc
      @lipidos = lip
      @valor_energetico
    end

    def to_s
      out = ""
      out = @name << " - "
      out << "Proteinas " << @proteinas.to_s << " - "
      out << "Glucidos " << @glucidos.to_s << " - "
      out << "Lipidos " << @lipidos.to_s << " - "
      out << "Valor energético " << calcular_v_energetico.to_s << "."
      out
    end

    def calcular_v_energetico
      @valor_energetico = (@glucidos*4)+(@proteinas*4)+(@lipidos*9)
      @valor_energetico
    end

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
