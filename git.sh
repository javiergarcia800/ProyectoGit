# Todos los archivos pueden estar en 2 estados:
# Tracked   => No modificados, Modificados, en Stage.
# Untracked => Cualquier archivo que aun no ha estado en Stage.

# Asignar variables globales o locales al repositorio.
git config --global user.name "Javier Islas"
git config --global user.mail javier.i@inspireinnovations.com

# Listar las configuraciones.
git config --list

# Clonar repositorios remotos.
git clone https://github.com/libgit2/libgit2

# Mostrar el estatus de los archivos en el repositorio local.
git status

# Deshacer cambios locales.
git checkout *.txt

# Agregar archivos al Stage para commit.
git add *.txt

# Pasa archivos de Stage a Modified.
git reset HEAD *.txt

# Hacer commit en el repositorio local.
git commit -m "Mensaje"

# Hacer commit en el repositorio local sin pasar por Stage.
# Hace commit de los archivos tracked aunque no esten en Stage.
git commit -a -m "Mensaje"

# Se hace commit de los cambios en el Stage, pero NO se crea un
# nuevo commit, se toma el ultimo commit y se le agregan los nuevos
# cambios al ultimo commit.
git commit --amend

# Mostrar cambios que NO estan en Stage.
git diff

# Mostrar los cambios que SI estan en Stage para commit.
git diff --staged
git diff --cached

# Remueve un archivo del working directory y del Staging Area.
# Tambien se puede eliminar el archivo del working Directory
# y ejecutar el comando: git add para pasar el cambio al Stage.
git rm *.txt

# Renombra un archivo y pasa el cambio al Stage.
# Este comando es igual a renombrar el archivo en el working directory,
# elminar el archivo anterior anterior del Stage y agregar al Stage el nuevo.
git mv file.txt file_2.txt

# .gitignore
# ==========
# El archivo .gitignore tiene reglas de archivos para ser ignorados por GIT.

# Mostrar el estatus de los archivos en el repositorio local con flags cortos.
# Los flags regresan en 2 columns: En Stage y en Working Directory.
git status -s
git status --short
#  M - Modified in working directory
# M  - Modified and in Staged
# ?? - files no Tracked
# A  - new Files in Stage
# MM - Modified and in Staged AND After Modified in working directory.

# Mostrar el historial de commits.
# -p Para mostrar los cambios en cada commit.
# -2 Para mostrar solo 2 commits anteriores.
# --stat  para mostrar un resumen del commit.
# --since=2.weeks para mostrar logs desde hace 2 semanas.
git log

# Mostrar el historial de commits con los cambios en cada commit.
git log -p

# Mostrar el historial de commits con los cambios en cada commit (Solo 2 commits).
git log -p -2


# *****************
# REMOTES
# *****************
# Listar los repositorios remotos.
# -v Para la URL de repositorio remote que GIT usara.
git remote

# Clonar un repostirio remoto.
git clone https://...

# Para agregar un nuevo Repositorio Remoto.
git remote add <shortname> https://

# Mostrar informacion de un repositorio remoto.
git remote show origin

# Para obtener datos desde un repositorio remote.
git fetch <shorname>    # Nombre del repositorio remoto.

# Traer datos desde el repositorio remoto clonado y
# automaticamente intenta hacer merge en el repositorio local.
git pull

# Enviar datos al repositorio remoto.
# Si alguien mas ha subido cambios antes del push,
# es necesario hacer fetch e incorporar cambios antes del push.
git push <shorname> <branch>


# cambiar el shortname de un repositirio remoto.
git remote rename nombre_anterio nombre_nuevo

# Para remover un repositorio remoto.
git remote remove <shorename>
