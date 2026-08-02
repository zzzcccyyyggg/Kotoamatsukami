# Kotoamatsukami

Kotoamatsukami es un ofuscador basado en LLVM 17 que utiliza el nuevo pasador de LLVM para implementar funciones de plugin con el fin de ofuscar múltiples idiomas y plataformas.

El nombre "Kotoamatsukami" proviene de mi anime favorito, **Naruto**, que contiene el genjutsu más poderoso de mi corazón.

En el futuro, proporcionaré una documentación completa sobre el tema. Por ahora, puedes encontrar los archivos de enlace dinámico Kotoamatsukami.so en la carpeta /bin/build.

Nota: Este proyecto ha sido creado por mí por interés personal y puede que no esté completo. Si tienes alguna pregunta sobre el proyecto, no dudes en contactarme.

**Ahora puedes probarlo en mi sitio web (un poco feo): http://39.102.210.108:8080/**

Lea la versión en chino: https://github.com/zzzcccyyyggg/Kotoamatsukami/blob/llvm-17-plugins/readme-CN.md

Para más detalles sobre el algoritmo de ofuscación, consulta: https://github.com/zzzcccyyyggg/Kotoamatsukami/blob/llvm-17-plugins/docs/Obfuscation-algorithm.md

## Instalación

Puedes compilar el proyecto LLVM 17 tú mismo en tu computadora y luego modificar el archivo CMakeLists.txt de este proyecto para compilarlo.

A continuación, se muestran los comandos que utilicé como referencia:

```
git clone --depth 1 -b release/17.x https://github.com/llvm/llvm-project.git
mkdir build
cmake -G Ninja -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_TARGETS_TO_BUILD="X86;ARM;AArch64" -DCMAKE_BUILD_TYPE=Release -DLLVM_INCLUDE_TESTS=OFF -DLLVM_ENABLE_RTTI=ON -DCMAKE_INSTALL_PREFIX=./build/ ../llvm-project/llvm
ninja -j8
ninja install
```

Estos comandos instalarán los productos compilados en <tu_directorio_llvm>/build. Luego, necesitarás modificar el archivo CMakeLists.txt de este proyecto.

```
cd Kotoamatsukami
git submodule update --init --recursive
mkdir build
cd build
cmake ..
make -j
```

Proceso completado. ~~

## Uso

Ahora puedes utilizar este ofuscador fácilmente. Primero, debes instalar clang-17 y luego modificar el archivo `Kotoamatsukami_so` en `compiler/clang_wrapper.sh`. Después, puedes usarlo en el directorio `compiler`. También proporcionaré el archivo .so compilado en `/bin`.

(Nota: Si no lo utilizas en el directorio `compiler`, asegúrate de copiar `/compiler/Kotoamatsukami.config` y `/compiler/branch2call_process.py` a tu directorio de trabajo).

Las opciones de compilación disponibles se muestran a continuación:

```sh
./clang_wrapper.sh flatten branch2call …… <archivo_entrada> -o <archivo_salida>
```

- `<archivo_entrada>`: Ruta al archivo de código fuente que deseas ofuscar (por ejemplo, my_program.c).
- `-o <archivo_salida>`: Ruta al archivo ejecutable de salida (por ejemplo, my_program).
- `{opciones_de_ofuscación}`: Lista de opciones de ofuscación separadas por espacios que deseas aplicar. Las opciones disponibles son:
  - **split-basic-block**: Divide los bloques básicos dentro del código.
  - **anti-debug**: Inserta técnicas anti-depuración.
  - **gv-encrypt**: Cifra las variables globales.
  - **bogus-control-flow**: Inserta un flujo de control falso para confundir el análisis.
  - **add-junk-code**: Añade código basura para aumentar el tamaño y la complejidad del código.
  - **loopen**: Aplica ofuscación basada en bucles.
  - **for-obs**: Aplica ofuscación basada en bucles for.
  - **branch2call-32**: Convierte ramas en llamadas (versión de 32 bits).
  - **branch2call**: Convierte ramas en llamadas.
  - **indirect-call**: Inserta llamadas a funciones indirectas.
  - **indirect-branch**: Inserta ramas indirectas.
  - **flatten**: Aplana el flujo de control del programa.
  - **substitution**: Reemplaza instrucciones con secuencias equivalentes.

**Ejemplo:**

Para ofuscar un archivo llamado rc4.c aplicando cifrado de variables globales y flujo de control falso, y generar un ejecutable llamado rc4, utiliza:

```sh
./clang_wrapper.sh gv-encrypt bogus-control-flow ./tests/rc4.c -o ./tests/rc4
```

Para aplicar solo cifrado de variables globales:

```sh
./clang_wrapper.sh gv-encrypt ./tests/rc4.c -o ./tests/rc4
```

### Detalles

Puedes configurar el archivo de configuración en `/tmp/Kotoamatsukami/Kotoamatsukami.config`. El formato es el siguiente:

**`0`**: Todas las funciones están desactivadas (todo está deshabilitado).

**`1`**: Todas las funciones están activadas (todo está habilitado).

**`2`**: Activa solo las funciones que ya están activadas (mantiene las funciones activas, deja las demás sin cambios).

**`3`**: Activa todas las funciones excepto aquellas que están explícitamente desactivadas (habilita todas las funciones que no están desactivadas).

Puedes encontrar un ejemplo de Kotoamatsukami.config en: https://github.com/zzzcccyyyggg/Kotoamatsukami/blob/llvm-17-plugins/compiler/Kotoamatsukami.config

Para utilizar Kotoamatsukami.so, ejecuta el siguiente comando:

```shell
<tu-clang-17> -fpass-plugin=<tu-Kotoamatsukami_so>
```
