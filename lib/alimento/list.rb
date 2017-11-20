# Author::    Richard Morales Luis (alu0100909678@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby

# create a Struct with :value, :next and :prev
  Node = Struct.new(:value, :next, :prev)

  # Esta clase se ha creado para representar una lista doblemente enlazada.
  # Se ha incluido el mixin Enumerable.
  class List
    attr_reader :head, :tail, :size
    include Enumerable

    # Se asignan los parámetros head y tail siendo estos nodos en la lista.
    def initialize()
      @head = Node.new(nil,nil,nil)
      @tail = Node.new(nil,nil,nil)
      @size = 0
    end
     # Salida formateada de la lista.
    def to_s
      i = 0
      nodo_out = Node.new(@tail.value,@tail.next,@tail.prev)
      while (i <= @size)
        puts nodo_out.value
        puts " "
        if(nodo_out.next.next == nil)
          puts nodo_out.next.value
          i = @size+1
        else
          nodo_out.value = nodo_out.next.value
          nodo_out.next = nodo_out.next.next
        end
      end
    end

    # Metodo insertar en la lista.
    def push(values)
        nodo_in = Node.new(values,nil,@head)
        if (@size == 0)
          @head = Node.new(values, nil,nil)
          @tail = @head
          @size+=1
        elsif (@size == 1)
          @head = nodo_in
          @tail.next = @head
          @head.prev = @tail
          @size+=1
        elsif (@size > 1)
          aux = Node.new(@head.value,nodo_in,@head.prev)
          aux.prev.next = aux
          @head = nodo_in
          @head.prev.next = @head
          @size+=1
        end
   end

   # Sacar elementos por la cola.
   def pop()
     if(@size==0)
       puts "Lista vacía"
     elsif(@size == 1)
       aux = Node.new(@tail.value,nil,nil)
       @size-=1
       @head = Node.new(nil,nil,nil)
       @tail = Node.new(nil,nil,nil)
       "#{aux.value}"
     elsif(@size > 1)
       @size-=1
       aux = Node.new(@tail.value,nil,nil)
       @tail.next.prev = nil
       @tail = @tail.next
       "#{aux.value}"
     end
   end

   # Sacar elementos por la cabeza.
   def pop_back()
     if(@size==0)
       puts "Lista vacía"
     elsif(@size == 1)
       aux = Node.new(@head.value,nil,nil)
       @size-=1
       @head = Node.new(nil,nil,nil)
       @tail = Node.new(nil,nil,nil)
       "#{aux.value}"
     elsif(@size > 1)
       @size-=1
       aux = Node.new(@head.value,nil,nil)
       @head.prev.next = nil
       @head = @head.prev
       "#{aux.value}"
     end
   end

   # Método each del mixin Enumerable.
   def each()
     i = 0
     node_aux = @tail
     while (i <= @size)
       yield node_aux.value
       if(node_aux.next == nil)
         i = @size+1
       else
        i+=1
         node_aux.value = node_aux.next.value
         node_aux.next = node_aux.next.next
       end
     end
     yield node_aux.value
   end
end
