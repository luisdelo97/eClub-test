# eClub

Este proyecto es una prueba técnica para eClub. La aplicación Flutter utiliza `GoRouter` para la navegación y cuenta con un flujo que incluye una pantalla de inicio y un menú en la parte inferior. A través de estos elementos, se debe poder navegar según las indicaciones de las flechas en el documento.

## Requisitos previos

Antes de comenzar, asegúrate de tener instalados los siguientes requisitos:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versión ^3.27.1)
- Android Studio con:
  - Android SDK
  - Herramientas de línea de comandos de Android
- Un dispositivo Android o un emulador configurado
- Git para clonar el repositorio

## Pasos para generar la APK

Sigue estos pasos para generar la APK de Android:

1. **Clonar el repositorio**  
   Clona este repositorio en tu máquina local:

   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd eclub
   ```

2. **Instalar dependencias**  
   Ejecuta el siguiente comando para instalar las dependencias del proyecto:

   ```bash
   flutter pub get
   ```

3. **Configurar el entorno de Android**  
   Asegúrate de que Flutter pueda detectar tu entorno de Android ejecutando:

   ```bash
   flutter doctor
   ```

   Resuelve cualquier problema que aparezca relacionado con Android.

4. **Generar la APK**  
   Ejecuta el siguiente comando para generar la APK:

   ```bash
   flutter build apk --release
   ```

   Esto generará un archivo APK en la ruta `build/app/outputs/flutter-apk/app-release.apk`.

5. **Probar la APK**  
   Puedes instalar la APK en un dispositivo Android ejecutando:
   ```bash
   flutter install
   ```

## Estructura del proyecto

- [`lib`](lib): Contiene el código fuente principal de la aplicación. Cada subcarpeta dentro de `lib` representa una pantalla o funcionalidad principal de la aplicación. A continuación, se detalla la estructura:
  - [`analisis`](lib/analisis): Contiene la pantalla de análisis, junto con sus widgets específicos.
  - [`gastos`](lib/gastos): Contiene la pantalla de gastos, con una subcarpeta `widgets` para los componentes reutilizables de esta pantalla.
  - [`home`](lib/home): Contiene la pantalla principal de inicio, con una subcarpeta `widgets` para los componentes específicos de esta pantalla.
  - [`movimientos`](lib/movimientos): Contiene la pantalla de movimientos, con una subcarpeta `widgets` para los widgets relacionados.
  - [`bottom_app_bar.dart`](lib/bottom_app_bar.dart): Implementa la barra de navegación inferior.
  - [`chart.dart`](lib/chart.dart): Contiene la lógica y los widgets para los gráficos utilizados en la aplicación.
  - [`formatter.dart`](lib/formatter.dart): Incluye utilidades para formatear datos.
  - [`main.dart`](lib/main.dart): Punto de entrada principal de la aplicación.
  - [`router.dart`](lib/router.dart): Configuración de las rutas y navegación de la aplicación.

## Notas adicionales

- Si necesitas personalizar la configuración de la compilación, puedes modificar los archivos en la carpeta [`android`](android).
- Para más información sobre cómo firmar la APK para producción, consulta la [documentación oficial de Flutter](https://docs.flutter.dev/deployment/android).

## Contacto

Si tienes alguna pregunta o problema, puedes contactar conmigo [luisdelorenzi97@gmail.com](mailto:luisdelorenzi97@gmail.com).
