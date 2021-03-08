class Vector2
    # Representa un vector de dos dimensiones

    attr_accessor :coordx,:coordy

    def initialize(coordx,coordy)
        # Inicializador
        @coordx = coordx
        @coordy = coordy
    end

    def magnitud
        # Calcula la distancia euclidiana del origen (0,0) al vector
        ((@coordx)**2+(@coordy)**2)**(0.5)
    end

    def to_s
        # Este es el to string
        "(#{self.coordx},#{self.coordy})"
    end

    def +(obj)
        # La suma entre vectores
        self.class.new(self.coordx+obj.coordx,self.coordy+obj.coordy)
    end

    def ==(obj)
        # Igualdad entre vectores
        if self.coordx == obj.coordx and self.coordy == obj.coordy
            true
        else
            false
        end
    end

    def -@
        # La negación de un vector
        self.class.new(-self.coordx,-self.coordy)
    end

    def -(obj)
        # La resta entre dos vectores
        self.class.new(self.coordx-obj.coordx,self.coordy-obj.coordy)
    end

    def *(obj)
        # La multiplicación entre dos vectores
        self.coordx * obj.coordx + self.coordy * obj.coordy
    end

end

class Complejo < Vector2
    # Representa los números complejos como herencia de Vector2

    def initialize(coordx,coordy=0)
        # Inicializador
        @coordx = coordx
        @coordy = coordy
    end

    def to_s
        # Este es el to string
        if not self.coordx == 0
            string="#{self.coordx}"
            if not self.coordy == 0
                if self.coordy>0
                    string=string+"+#{self.coordy}i"
                else
                    string=string+"#{self.coordy}i"
                end
            end
        else
            string="#{self.coordy}i"
        end
        string
    end

    def *(obj)
        # Multiplicación entre dos complejos
        self.class.new(
            (self.coordx * obj.coordx - self.coordy * obj.coordy),
            (self.coordx * obj.coordy + self.coordy*obj.coordx))
    end

    def ~@
        # El conjugado del número complejo
        self.class.new(self.coordx,-self.coordy)
    end

    def /(obj)
        # División de complejos
        if(obj.coordx != 0 or obj.coordy != 0)
            self.class.new(
                (self.coordx * obj.coordx + self.coordy * obj.coordy)/(obj.coordx**2 + obj.coordy**2),
                (self.coordy * obj.coordx - self.coordx * obj.coordy)/(obj.coordx**2 + obj.coordy**2))
        else
            puts "Error: No podemos dividir por 0"
        end
    end

end

class Complejo2
    # Representa los números complejos pero con composición

    attr_accessor :coordx,:coordy,:vector

    def initialize(real,imaginario=0)
        # Inicializador
        @vector = Vector2.new(real,imaginario)
        @coordx = real
        @coordy = imaginario
        
    end

    def to_s
        # Representa el método to string
        if not self.coordx == 0
            string="#{self.coordx}"
            if not self.coordy == 0
                if self.coordy>0
                    string=string+"+#{self.coordy}i"
                else
                    string=string+"#{self.coordy}i"
                end
            end
        else
            string="#{self.coordy}i"
        end
        string
    end

    def *(obj)
        # Multiplicación entre complejos
        self.class.new((self.coordx * obj.coordx - self.coordy * obj.coordy),(self.coordx * obj.coordy + self.coordy*obj.coordx))
    end

    def ~@
        # El conjugado del número complejo
        self.class.new(self.coordx,-self.coordy)
    end

    def /(obj)
        # División de complejos
        if(obj.coordx != 0 or obj.coordy != 0)
            self.class.new(
                (self.coordx * obj.coordx + self.coordy * obj.coordy)/(obj.coordx**2 + obj.coordy**2),
                (self.coordy * obj.coordx - self.coordx * obj.coordy)/(obj.coordx**2 + obj.coordy**2))
        else
            puts "Error: No podemos dividir por 0"
        end
    end

    def magnitud
        # Distancia euclideana si vemos al complejo como un vector
        self.vector.magnitud
    end

    def +(obj)
        # Suma de dos números complejos como un vector
        self.vector + obj.vector
    end

    def ==(obj)
        # Igualdad de vectores
        self.vector == obj.vector
    end

    def -@
        # Negativo del vector que representa al complejo
        -self.vector
    end

    def -(obj)
        # Resta de complejos como si fuese un vector
        self.vector - obj.vector
    end

end

## Main
puts "**************************"
puts "Prueba de Vectores"
puts "Creo un vector1 (1,2) y pruebo to_s"
vector1=Vector2.new(1,2)
puts vector1

puts "Accedo a la coordenada x de vector1 (1,2)"
puts vector1.coordx

puts "Accedo a la coordenada y de vector1 (1,2)"
puts vector1.coordy

puts "Magnitud de vector1"
puts (vector1.magnitud)

puts "Creo un vector2 (2,4)"
vector2=Vector2.new(2,4)
puts vector2

puts "Sumo vector1 con vector2"
puts (vector1+vector2)

puts "Resto vector1 con vector2"
puts (vector1-vector2)

puts "Multiplico vector1 con vector2 (producto punto)"
puts (vector1*vector2)

puts "Pregunto si son iguales vector1 con vector2"
puts (vector1==vector2)

puts "- vector1 como operador unario"
puts (-vector1)

puts "**************************"
puts "Prueba de Complejo"
puts "Creo un complejo(-1,20) y pruebo to_s"
complejo1=Complejo.new(-1,20)
puts complejo1

puts "Accedo a la coordenada x (parte real) de complejo1 (-1,20)"
puts complejo1.coordx

puts "Accedo a la coordenada y (parte imaginaria) de complejo1 (-1,20)"
puts complejo1.coordy

puts "Magnitud de complejo1"
puts (complejo1.magnitud)

puts "Creo un complejo2 (2)"
complejo2=Complejo.new(2)
puts complejo2

puts "Sumo complejo1 con complejo2"
puts (complejo1+complejo2)

puts "Resto complejo1 con complejo2"
puts (complejo1-complejo2)

puts "Multiplico complejo1 con complejo2 (producto punto)"
puts (complejo1*complejo2)

puts "Pregunto si son iguales complejo1 con complejo2"
puts (complejo1==complejo2)

puts "- complejo1 como operador unario"
puts (-complejo1)

puts "Divido complejo1 entre complejo2"
puts (complejo1/complejo2)

puts "Divido entre un complejo que sea 0"
puts (complejo2/Complejo.new(0))

puts "Conjugado del complejo1"
puts (~complejo1)

puts "**************************"
puts "Prueba de Complejo2"
puts "Creo un complejo(-1,20) y pruebo to_s"
complejo1=Complejo2.new(-1,20)
puts complejo1

puts "Accedo a la coordenada x (parte real) de complejo1 (-1,20)"
puts complejo1.coordx

puts "Accedo a la coordenada y (parte imaginaria) de complejo1 (-1,20)"
puts complejo1.coordy

puts "Magnitud de complejo1"
puts (complejo1.magnitud)

puts "Creo un complejo2 (2)"
complejo2=Complejo2.new(2)
puts complejo2

puts "Sumo complejo1 con complejo2"
puts (complejo1+complejo2)

puts "Resto complejo1 con complejo2"
puts (complejo1-complejo2)

puts "Multiplico complejo1 con complejo2 (producto punto)"
puts (complejo1*complejo2)

puts "Pregunto si son iguales complejo1 con complejo2"
puts (complejo1==complejo2)

puts "- complejo1 como operador unario"
puts (-complejo1)

puts "Divido complejo1 entre complejo2"
puts (complejo1/complejo2)

puts "Divido entre un complejo que sea 0"
puts (complejo2/Complejo.new(0))

puts "Conjugado del complejo1"
puts (~complejo1)