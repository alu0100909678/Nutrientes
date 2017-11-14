#Richard Morales Luis

# create a Struct with :value, :next and :prev
  Node = Struct.new(:value, :next, :prev)

  class List #Clase Lista doblemente enlazada.
    attr_reader :head, :tail, :size
    include Enumerable
    def initialize()
      @head = Node.new(nil,nil,nil)
      @tail = Node.new(nil,nil,nil)
      @size = 0
    end

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

#Metodo insertar en la lista.
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

#Sacar elementos por la cola.
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

#Sacar elementos por la cabeza.
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

   def each()
     i = 0
     while (i <= @size)
       yield @tail.value
       if(@tail.next == nil)
         i = @size+1
       else
        i+=1
         @tail.value = @tail.next.value
         @tail.next = @tail.next.next
       end
     end
     yield @tail.value
   end
end