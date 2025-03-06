## Principios de Diseño de Software

### 1. Principios SOLID
(Son cinco principios fundamentales para diseño de software en POO)

- **S**: Single Responsibility Principle (SRP) → Una clase debe tener una única razón para cambiar.
- **O**: Open/Closed Principle (OCP) → El código debe estar abierto para extensión, pero cerrado para modificación.
- **L**: Liskov Substitution Principle (LSP) → Una subclase debe poder sustituir a su superclase sin romper la funcionalidad.
- **I**: Interface Segregation Principle (ISP) → No forzar a las clases a depender de interfaces que no usan.
- **D**: Dependency Inversion Principle (DIP) → Depender de abstracciones en lugar de implementaciones concretas.

### 2. Principios GRASP (General Responsibility Assignment Software Patterns)
(Patrones para asignar responsabilidades en diseño orientado a objetos)

- **Creator** → Define qué clase debe crear objetos.
- **Controller** → Maneja las interacciones entre el sistema y el usuario.
- **Information Expert** → Asigna responsabilidades a la clase que tiene la información necesaria.
- **Low Coupling** → Reduce dependencias entre clases.
- **High Cohesion** → Mantiene cada clase con una única función bien definida.
- **Polymorphism** → Permite manejar múltiples comportamientos a través de interfaces.
- **Pure Fabrication** → Crea una clase que no representa un concepto del dominio para mejorar la arquitectura.
- **Indirection** → Introduce un intermediario para desacoplar dependencias.
- **Protected Variations** → Protege el código contra cambios futuros con abstracciones.

### 3. Otros Principios Claves

- **DRY** (Don't Repeat Yourself) → Evitar duplicación de código.
- **KISS** (Keep It Simple, Stupid) → Diseñar sistemas simples y fáciles de entender.
- **YAGNI** (You Ain't Gonna Need It) → No agregar funcionalidad innecesaria.
- **Separation of Concerns (SoC)** → Separar responsabilidades en diferentes módulos.
- **Encapsulación** → Proteger los datos dentro de una clase y exponer solo lo necesario.

## Patrones de Diseño de Software

### 1. Patrones Creacionales (Facilitan la creación de objetos)

- **Singleton** → Garantiza que solo exista una instancia de una clase.
- **Factory Method** → Permite crear objetos sin especificar su tipo exacto.
- **Abstract Factory** → Crea familias de objetos relacionados sin especificar sus clases concretas.
- **Builder** → Separa la construcción de un objeto complejo de su representación.
- **Prototype** → Crea nuevos objetos copiando una instancia existente.

### 2. Patrones Estructurales (Definen cómo se organizan las clases y objetos)

- **Adapter** → Permite que clases con interfaces incompatibles trabajen juntas.
- **Bridge** → Separa una abstracción de su implementación para permitir variaciones independientes.
- **Composite** → Permite tratar objetos individuales y compuestos de la misma manera.
- **Decorator** → Añade funcionalidad a un objeto sin modificar su estructura.
- **Facade** → Proporciona una interfaz simplificada a un sistema complejo.
- **Flyweight** → Reduce el uso de memoria compartiendo objetos en lugar de duplicarlos.
- **Proxy** → Actúa como un intermediario para controlar el acceso a un objeto.

### 3. Patrones de Comportamiento (Definen cómo interactúan los objetos)

- **Chain of Responsibility** → Pasa una solicitud a través de una cadena de manejadores.
- **Command** → Encapsula una acción como un objeto.
- **Interpreter** → Define una gramática para interpretar expresiones.
- **Iterator** → Proporciona una forma de recorrer una colección de objetos.
- **Mediator** → Centraliza la comunicación entre objetos en un mediador.
- **Memento** → Permite restaurar un objeto a un estado anterior.
- **Observer** → Define una dependencia uno-a-muchos entre objetos para que cuando uno cambie, los demás sean notificados.
- **State** → Permite que un objeto cambie su comportamiento según su estado interno.
- **Strategy** → Define una familia de algoritmos y los hace intercambiables en tiempo de ejecución.
- **Template Method** → Define el esqueleto de un algoritmo y permite que las subclases definan partes de la lógica.
- **Visitor** → Separa algoritmos de las estructuras de datos sobre las que operan.