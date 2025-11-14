# Calculadora Matemática - FormuLab
Una calculadora educativa para estudiantes de ESO y Bachillerato que combina información sobre fórmulas matemáticas con herramientas de cálculo interactivas.

## 🏗️ Arquitectura

Este proyecto utiliza **Arquitectura Hexagonal (Ports & Adapters)** y principios de **Domain-Driven Design (DDD)**, organizando el código en capas bien definidas:

### Estructura del Proyecto

```
lib/
├── domain/                    # Capa de Dominio (Núcleo de Negocio)
│   ├── entities/             # Entidades del dominio
│   │   ├── formula.dart
│   │   └── ecuacion_segundo_grado.dart
│   ├── value_objects/        # Objetos de Valor
│   │   └── resultado_ecuacion.dart
│   ├── repositories/          # Interfaces (Puertos)
│   │   └── formula_repository.dart
│   └── usecases/             # Casos de Uso
│       ├── obtener_formulas_usecase.dart
│       ├── obtener_formula_por_id_usecase.dart
│       └── resolver_ecuacion_segundo_grado_usecase.dart
│
├── application/              # Capa de Aplicación
│   └── dtos/                 # Data Transfer Objects
│       └── formula_dto.dart
│
├── infrastructure/           # Capa de Infraestructura (Adaptadores)
│   ├── data_sources/         # Fuentes de Datos
│   │   └── formula_data_source.dart
│   └── repositories/        # Implementaciones de Repositorios
│       └── formula_repository_impl.dart
│
└── presentation/             # Capa de Presentación (UI)
    ├── pages/               # Páginas/Pantallas
    │   ├── home_page.dart
    │   ├── formulas_list_page.dart
    │   └── formula_detail_page.dart
    └── widgets/             # Widgets Reutilizables
        └── calculadora_ecuacion_segundo_grado.dart
```

## 📚 Características

### Fórmulas Disponibles

- **Ecuación de Segundo Grado**: Fórmula general con calculadora interactiva
- **Teorema de Pitágoras**: Para triángulos rectángulos
- **Área de un Círculo**: Cálculo del área usando el radio
- **Volumen de una Esfera**: Cálculo del volumen
- **Distancia entre Dos Puntos**: Geometría analítica

### Funcionalidades

- ✅ Visualización de fórmulas con información detallada
- ✅ Calculadora interactiva para ecuaciones de segundo grado
- ✅ Búsqueda y filtrado de fórmulas por categoría (ESO/Bachillerato)
- ✅ Explicaciones y ejemplos para cada fórmula
- ✅ Interfaz moderna y responsive

## 🚀 Cómo Ejecutar

1. Asegúrate de tener Flutter instalado (SDK 3.9.2 o superior)
2. Instala las dependencias:
   ```bash
   flutter pub get
   ```
3. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## 🎯 Principios de Diseño

### Arquitectura Hexagonal

- **Puertos (Ports)**: Interfaces definidas en la capa de dominio
- **Adaptadores (Adapters)**: Implementaciones en infrastructure y presentation
- **Dominio Independiente**: El dominio no depende de frameworks ni de la UI

### Domain-Driven Design

- **Entidades**: Objetos con identidad única (Formula, EcuacionSegundoGrado)
- **Value Objects**: Objetos inmutables sin identidad (ResultadoEcuacion)
- **Repositorios**: Abstracciones para acceso a datos
- **Casos de Uso**: Lógica de negocio encapsulada

### Separación de Responsabilidades

- **Domain**: Lógica de negocio pura, sin dependencias externas
- **Application**: Orquestación y DTOs
- **Infrastructure**: Implementaciones concretas (memoria, base de datos, APIs)
- **Presentation**: UI y widgets de Flutter

## 📝 Ejemplo de Uso

### Resolver una Ecuación de Segundo Grado

1. Navega a "Ver Fórmulas"
2. Selecciona "Ecuación de Segundo Grado"
3. Ingresa los coeficientes:
   - a = 2
   - b = 5
   - c = -3
4. Presiona "Calcular"
5. Obtén las soluciones: x₁ y x₂

## 🔮 Próximas Mejoras

- [ ] Calculadoras para más fórmulas (Pitágoras, áreas, volúmenes)
- [ ] Guardado de historial de cálculos
- [ ] Gráficas para visualizar ecuaciones
- [ ] Modo oscuro
- [ ] Soporte para múltiples idiomas
- [ ] Integración con base de datos local
- [ ] Exportación de resultados

## 📄 Licencia

Este proyecto es de uso educativo.
