#Richard Morales Luis.

require "spec_helper"


RSpec.describe Alimento do
  before :all do
    @huevo_f = Alimento::Alimento.new("Huevo Frito", 14.1, 0.0, 19.5)
    @Leche_vaca = Alimento::Alimento.new("Leche Vaca", 3.3, 4.8, 3.2)
    @Yogurt = Alimento::Alimento.new("Yogurt", 3.8, 4.9, 3.8)
    @Cerdo = Alimento::Alimento.new("Cerdo", 21.5, 0.0, 6.3)
    @Ternera = Alimento::Alimento.new("Ternera", 21.1, 0.0, 3.1)
    @Pollo = Alimento::Alimento.new("Pollo", 20.6, 0.0, 5.6)
    @Bacalao = Alimento::Alimento.new("Bacalao", 17.7, 0.0, 0.4)
    @Atun = Alimento::Alimento.new("Atun", 21.5, 0.0, 15.5)
    @Salmon = Alimento::Alimento.new("Salmon", 19.9, 0.0, 15.5)
    @Aceite = Alimento::Alimento.new("Aceite de Olivda", 0.0, 0.2, 99.6)
    @Chocolate = Alimento::Alimento.new("Chocolate", 5.3, 47.0, 30.0)
    @Azucar = Alimento::Alimento.new("Azucar", 0.0, 99.8, 0.0)
    @Arroz = Alimento::Alimento.new("Arroz", 6.8, 77.7, 0.6)
    @Lentejas = Alimento::Alimento.new("Lentejas", 23.5, 52.0, 1.4)
    @Papas = Alimento::Alimento.new("Papas", 2.0, 15.4, 0.1)
    @Tomate = Alimento::Alimento.new("Tomate", 1.0, 3.5, 0.2)
    @Cebolla = Alimento::Alimento.new("Cebolla", 1.3, 5.8, 0.3)
    @Manzana = Alimento::Alimento.new("Manzana", 0.3, 12.4, 0.4)
    @Platanos = Alimento::Alimento.new("Platanos", 1.2, 21.5, 0.2)
  end

  context "# comprobando el nombre del alimento" do
    it "Se almacena correctamente el nombre" do
     expect(@huevo_f.name).to eq("Huevo Frito")
   end
  end

  context "# comporando parametros" do
    it "Se comprueba el almacenamiento de las proteinas" do
      expect(@huevo_f.proteinas).to eq(14.1)

    end
      it "Se comprueba el almacenamiento de los glucidos" do
        expect(@huevo_f.glucidos).to eq(0.0)
      end
      it "Se comprueba el almacenamiento de los lipidos" do
        expect(@huevo_f.lipidos).to eq(19.5)
      end

      it "Se comprueba la salida del alimento formateado" do

        expect(@huevo_f.to_s).to eq("Huevo Frito - Proteinas 14.1 - Glucidos 0.0 - Lipidos 19.5 - Valor energético 231.9.")
      end
    end

    context "# comprobando funcion valor energético" do
      it"Se comprueba el calculo del valor energético para todos los alimentos." do
        expect(@huevo_f.calcular_v_energetico).to eq(231.9)
        expect(@Leche_vaca.calcular_v_energetico).to eq(61.2)
        expect(@Yogurt.calcular_v_energetico).to eq(69.0)
        expect(@Cerdo.calcular_v_energetico).to eq(142.7)
        expect(@Ternera.calcular_v_energetico).to eq(112.30000000000001)
        expect(@Pollo.calcular_v_energetico).to eq(132.8)
        expect(@Bacalao.calcular_v_energetico).to eq(74.39999999999999)
        expect(@Atun.calcular_v_energetico).to eq(225.5)
        expect(@Salmon.calcular_v_energetico).to eq(219.1)
        expect(@Aceite.calcular_v_energetico).to eq(897.1999999999999)
        expect(@Chocolate.calcular_v_energetico).to eq(479.2)
        expect(@Azucar.calcular_v_energetico).to eq(399.2)
        expect(@Arroz.calcular_v_energetico).to eq(343.4)
        expect(@Lentejas.calcular_v_energetico).to eq(314.6)
        expect(@Papas.calcular_v_energetico).to eq(70.5)
        expect(@Tomate.calcular_v_energetico).to eq(19.8)
        expect(@Cebolla.calcular_v_energetico).to eq( 31.099999999999998)
        expect(@Manzana.calcular_v_energetico).to eq(54.400000000000006)
        expect(@Platanos.calcular_v_energetico).to eq(92.6)
      end
    end

    context "# comprobando modulo comparable" do
      it "Se comprueba el menor" do
        expect(@huevo_f < @Leche_vaca).to eq(false)
      end
      it "Se comprueba el mayor" do
        expect(@huevo_f > @Leche_vaca).to eq(true)
      end
      it "Se comprueba el menor o igual" do
        expect(@huevo_f <= @Leche_vaca).to eq(false)
      end
      it "Se comprueba el mayor o igual" do
        expect(@huevo_f >= @Leche_vaca).to eq(true)
      end
      it "Se comprueba el igual" do
        expect(@huevo_f == @huevo_f).to eq(true)
      end
      it "Se comprueba que el alimento es distinto de un numero" do
        expect(@huevo_f == 1).to eq(false)
      end
    end
end

RSpec.describe List do
  before :each do
    @list = List.new()
    @huevo_f = Alimento::Alimento.new("Huevo Frito", 14.1, 0.0, 19.5)
    @Leche_vaca = Alimento::Alimento.new("Leche Vaca", 3.3, 4.8, 3.2)
    @Yogurt = Alimento::Alimento.new("Yogurt", 3.8, 4.9, 3.8)

  end

  context "# Comprobamos que existe una lista vacía con un head y un tail" do
    it"Comprbamos que hay un head" do
      expect(@list.head.value).to eq(nil)
    end
    it" Comprobamos que hay un tail" do
      expect(@list.tail.value).to eq(nil)
    end
    it "Comprobamos que la lista está vacía" do
      expect(@list.size).to eq(0)
    end
  end
  context "# Comprobando metodos de push y pop" do
    it" Comprobando tamaño del size al insertar"do
    @list.push(1)
    @list.push(@huevo_f)
    expect(@list.size).to eq(2)
    end
    it " Comprobando metodo pop y pop_back con size de 2 a 1" do
      valor = [1,@huevo_f,2,3]
      valor.each do |i|
      @list.push("#{i}")
    end
      expect(@list.size).to eq(4)
      expect(@list.pop()).to eq("1")
      expect(@list.pop_back()).to eq("3")
      expect(@list.size).to eq(2)
      expect(@list.pop()).to eq("Huevo Frito - Proteinas 14.1 - Glucidos 0.0 - Lipidos 19.5 - Valor energético 231.9.")
    end
  end
  context " Comprobando modulo enumerable" do
    it "Comprobando all? con lista vacía" do
      expect(@list.all?).to eq(false)
    end
    it "Comprobando all? con lista con un elemento" do
    @list.push(@huevo_f)
    expect(@list.all?).to eq(true)
    end
    it "Comprobando any con lista vacía" do
      expect(@list.any?).to eq(false)
    end
    it "Comprobando any? con lista con varios elemento" do
    @list.push(@huevo_f)
    @list.push(@Leche_vaca)
    expect(@list.any?).to eq(true)
    end
    it "Comprobando find con lista con varios elemento" do
    @list.push(@huevo_f)
    @list.push(@Leche_vaca)
    expect(@list.find {|i| i == @huevo_f}).to eq(@huevo_f)
    expect(@list.find {|i| i == 2}).to eq(nil)
    end
    it "Comprobando map con lista con varios elemento" do
    @list.push(@huevo_f)
    @list.push(@Leche_vaca)
    @list.push(3)
    expect(@list.map{|i| i}).to eq([@huevo_f,@Leche_vaca,3,3])
     end
    it "Comprobando drop con lista con varios elemento" do
      @list.push(@huevo_f)
      @list.push(@Leche_vaca)
      @list.push(@Yogurt)
     expect(@list.drop(2)).to eq([@Leche_vaca,@Yogurt])
    end
   it "Comprobando min con lista con varios elemento" do
     @list.push(@huevo_f)
     @list.push(@Leche_vaca)
     @list.push(@Yogurt)
    expect(@list.min).to eq(@Leche_vaca)
   end
  it "Comprobando max con lista con varios elemento" do
    @list.push(@huevo_f)
    @list.push(@Leche_vaca)
    @list.push(@Yogurt)
   expect(@list.max).to eq(@huevo_f)
  end
 it "Comprobando count con lista con varios elemento" do
   @list.push(@huevo_f)
   @list.push(@Leche_vaca)
   @list.push(@Yogurt)
  expect(@list.count).to eq(4)
    end
  end
end

RSpec.describe Alimento::GAlimento do
  before :each do
    @huevo_f = Alimento::GAlimento.new("Huevo Frito", 14.1, 0.0, 19.5, "Huevo, lacteos y helados")
    @Leche_vaca = Alimento::GAlimento.new("Leche Vaca", 3.3, 4.8, 3.2, "Huevo, lacteos y helados")
    @Yogurt = Alimento::GAlimento.new("Yogurt", 3.8, 4.9, 3.8, "Huevo, lacteos y helados")
    @Cerdo = Alimento::GAlimento.new("Cerdo", 21.5, 0.0, 6.3, "Carnes y derivados")
    @Ternera = Alimento::GAlimento.new("Ternera", 21.1, 0.0, 3.1, "Carnes y derivados")
    @Pollo = Alimento::GAlimento.new("Pollo", 20.6, 0.0, 5.6, "Carnes y derivados")
    @Bacalao = Alimento::GAlimento.new("Bacalao", 17.7, 0.0, 0.4, "Pescados y mariscos")
    @Atun = Alimento::GAlimento.new("Atun", 21.5, 0.0, 15.5, "Pescados y mariscos")
    @Salmon = Alimento::GAlimento.new("Salmon", 19.9, 0.0, 15.5, "Pescados y mariscos")
    @Aceite = Alimento::GAlimento.new("Aceite de Olivda", 0.0, 0.2, 99.6, "Alimentos Grasos")
    @Chocolate = Alimento::GAlimento.new("Chocolate", 5.3, 47.0, 30.0, "Alimentos Grasos")
    @Azucar = Alimento::GAlimento.new("Azucar", 0.0, 99.8, 0.0, "Alimentos ricos en carbohidratos")
    @Arroz = Alimento::GAlimento.new("Arroz", 6.8, 77.7, 0.6, "Alimentos ricos en carbohidratos")
    @Lentejas = Alimento::GAlimento.new("Lentejas", 23.5, 52.0, 1.4, "Alimentos ricos en carbohidratos")
    @Papas = Alimento::GAlimento.new("Tomate", 1.0, 3.5, 0.2, "Alimentos ricos en carbohidratos")
    @Cebolla = Alimento::GAlimento.new("Cebolla", 1.3, 5.8, 0.3, "Verduras y Hortizas")
    @Manzana = Alimento::GAlimento.new("Manzana", 0.3, 12.4, 0.4, "Frutas")
    @Platanos = Alimento::GAlimento.new("Platanos", 1.2, 21.5, 0.2, "Frutas")
  end

  context "# Comprobamos la jerarquía de los objetos" do
    it "comprobamos con el is_a?" do
      expect(@huevo_f.is_a?Alimento::GAlimento).to eq(true)
      expect(@huevo_f.is_a?Alimento::Alimento).to eq(true)
    end
    it "comprobamos .class" do
      expect(@huevo_f.class).to eq(Alimento::GAlimento)
    end
    it "comprobamos kind_of" do
      expect(@huevo_f.kind_of?Alimento::Alimento).to eq(true)
      expect(@huevo_f.kind_of?BasicObject).to eq(true)
      expect(@huevo_f.kind_of?Object).to eq(true)
    end
  end
end
