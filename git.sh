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

# Mostrar el historial de commits en una linea.
git log --pretty=oneline

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


# ***************+
# TAGS
# ****************
# Existen los tags lightweight y annotated.
# lightweight Son solo apuntadores a un commit en especifico.
# annotated Se crean objetos en la base de datos de GIT y guardan un nombre_nuevo
# emakl y fecha.

# Listar los
# -l "v1.8..5" Listar tags que contengan un nombre especifico.
git tag

# (Annotated Tag) Para crear un tag.
git tag -a v1.4 -m "Mensaje"

# (Lightweight) Para crear un tag no se agregan: -a, -m, -s.
git tag v1.4-lw

# Para tag un commit pasado, para mostrar checksums (git log --pretty=oneline).
git tag -a v1.2 parte_del_checksum_del_commit

# Enviar un tag a un repositorio remoto.
git push origin <tagname>

# Enviar todos los tags que no esten en el repositirio remoto.
git push origin --tags

# Eliminar un tag del repositorio local.
git tag -d v1.4

# Elimina un tag del repositorio remoto.
git push origin --delete <tagname>

# Crear un alias "ci"  para commit.
git config --global alias.ci commit

# ****************
# BRANCHING
# ****************

# Cuando se hace un commit se crean los siguientes objetos:
# 1.- Archivos "blob" con el contenido del archivo que se incluye en el commit.
# 2.- Archivo "Tree" con apuntadores a cada blob del commit.
# 3.- Archivo "Commit" con el apuntador al "Tree" y la metadata del commit.

# HEAD es un apuntador al branch que esta actualmente (master).

# El apuntador "HEAD" apunta al apuntador "master",
# el apuntador "master" apunta al ultimo commit,
# el ultimo commit apunta al commit previo.

# Cuando se crea un nuevo branch se crea un nuevo apuntador al commit actual del branch actual (master).

# Crear un branch.
git branch nombre_del_branch

# Para ver los branches y donde apunta el HEAD.
git log --oneline --decorate

# Para cambiar a otro branch, con este comando el HEAD apunta al nuevo branch.
git checkout nombre_del_branch

# Cambiar entre branches cambia los archivos en su directorio local,
# al ultimo commit del branch.

# Crear un nuevo branch y cambiar a ese branch.
git checkout -b nuevo_branch

# Mostrar el historial de los branches.
git log --oneline --decorate --graph --all

# Eliminar un branch
git branch -d nombre_del_branch_a_eliminar

# Hacer merge de 2 branches, el merge se hace en el branch actual.
# Cuando se hace merge de 2 branches distintos, se crea un nuevo commit (merge commit).
# Si hay conflictos en el merge, se tienen que resolver, hacer git add y commit para terminar el merge.
# Para ver los archivos en conflicto (unmerge): git status.
git merge nombre_del_otro_branch

# Mostrar los branches y el branch actual (el branch al que apunta el HEAD).
git branch

# Para ver el ultimo commit de cada branch.
git branch -v

# Para ver los branches que se han hecho merge y aun no se han hecho merge.
git branch --merged
git branch --no-merged

# ****************
# Remote Branches
# ****************
