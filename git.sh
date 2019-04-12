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

# Mostrar los cambios que no estan en el branch master.
git diff master

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

# *************
# FORK
# *************
# En la pagina del proyecto original se da click en "Fork",
# eso crea un repositorio remoto al cual se pueden subir los cambios.
git remote add myfork https://
git push -u myfork branch_local

# Despues de subir los cambios al repositorio remoto forked,
# Se hace un "pull request" mediante web o mediante commandos.
# Con es sigueinte comando se obtiene informacion para enviar el pull request.
git request-pull origin/master myfork


# Para obtener datos desde un repositorio remote.
git fetch <shorname>    # Nombre del repositorio remoto.

# Traer datos desde el repositorio remoto clonado y
# automaticamente intenta hacer merge en el repositorio local.
git pull

# Enviar datos al repositorio remoto.
# Si alguien mas ha subido cambios antes del push,
# es necesario hacer fetch e incorporar cambios antes del push.
# Si el push falla porque alguien subio otros cambios,
# primero se debe hacer fetch y merge localmente antes de hacer el push.
git push <shorname> <branch>


# cambiar el shortname de un repositirio remoto.
git remote rename nombre_anterio nombre_nuevo

# Para remover un repositorio remoto.
git remote remove <shorename>

# Para agregar un repositirio remoto.
git remote add repositirio_remoto git://github.com/path/project.github
git fetch repositirio_remoto
git checkout -b branch_a_crear repositorio_remoto/branch_remoto


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

# (Lightweight) Para crear un tag (no se agregan: -a, -m, -s).
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

# Si el nombre_del_branch no existe en local pero si en remoto,
# Se crea un branch "TRACKING BRANCH" del branch remoto.
git checkout nombre_del_branch_remoto

# Cambiar entre branches cambia los archivos en su directorio local,
# al ultimo commit del branch.

# Crear un nuevo branch y cambiar a ese branch.
git checkout -b nuevo_branch

# Mostrar el historial de los branches.
git log --oneline --decorate --graph --all

# Para mostrar los commits desde la version branch local hasta el branch remoto.
git log branch_local..origin/branch_remoto

# Eliminar un branch
git branch -d nombre_del_branch_a_eliminar

# Hacer merge de 2 branches, el merge se hace en el branch actual.
# Cuando se hace merge de 2 branches distintos, se crea un nuevo commit (merge commit).
# Si hay conflictos en el merge, se tienen que resolver, hacer git add y commit para terminar el merge.
# Para ver los archivos en conflicto (unmerge): git status.
# El merge se basa en los ultmos commits de cada branch y el ultimo commit comun.
git merge nombre_del_otro_branch

# Mostrar los branches y el branch actual (el branch al que apunta el HEAD).
git branch

# Para ver el ultimo commit de cada branch.
git branch -v

# Para ver los branch locales y como estan en relacion a los branches remotos.
# ahead => Muestra los commit locales que no se han subido al remoto.
# behind => Muestra commits remotos que no se han bajado.
# Esta informacion solo es local, para actualizar esta informacion es necesario hacer: git fetch --all; git branch -vv
git branch -vv

# Para ver los branches que se han hecho merge y aun no se han hecho merge.
git branch --merged
git branch --no-merged

# ****************
# Remote Branches
# ****************

# Para sincronizar con un repositorio remoto.
# Esto solo recupera los cambios del repositorio remoto a la rama (origin/master),
# pero fectch no modifica el direcotrio local, solo obtiene los datos pero es
# necesario hacer el merge.
git fetch repositorio_remoto(origin)

# Para poner los cambios remotos (git fetch) en el directorio local.
git merge reposotorio_remoto/branch_remoto

# Si se quiere crear un branch local como el branch del repositorio remoto.
git checkout -b nombre_branch_local repositorio_remoto/branch_remoto

# Eliminar un branch del repositirio remoto.
git push origin --delete nombre_del_branch_a_eliminar

# Para enviar cambios de un branch local a otro branch remoto "refspec".
# -u es --set-upstream, lo cual configura el branch para pushing y pulling despues.
git push -u origin branch_local:branch_destino_remoto

# ******************
# PUSH
# ******************
# Para subir cambios locales a un repositirio/branch remoto.
git push repositorio_remoto branch(master)

# Para subir cambios locales a un repositorio remoto si los branches(local y remoto se llaman diferente).
# Esto crea un "TRACING BRANCH".
# El TRACKING BRANCH se puede setear explicitamente o al hacer un clone o checkout de un branch que no existia localmente.
git push repositirio_remoto branch_local:branch_remoto

# Para subir un branch al repositorio remoto(origin)
git push -u origin master

# ************+
# PULL
# ************
# En un TRACKING BRANCH, GIT sabe de que server trae los datos y hace merge.
git pull

# Hacer un git fetch seguido por un git merge.
# Generalmente es mejor usar fetch y merge explicitamnte, git pull puede ser confuso.
git pull

# Para guardar el directorio de trabajo (los cambios) sin agregarlos al stage.
# Para despues cambiar de branch.
git stash

# Mostrar cambios guardados con stash.
git stash list

# ****************
# REBASE
# ****************
# rebase => Cuando se tienen 2 branch, desde un branch se hace REBASE
# para pasar los cambios de ese branch al final del otro branch y hacer un commit.
# Rebase tiene el mismo resultado que merge pero el historial se ve como lineal
# no como en el merge que se en paralelo.
# Despues de hacer el rebase, el branch master puede hacer un fast-forward merge
# Para tener los 2 branches apuntando al ultimo commit.
# NO SE DEBE HACER REBASE EN BRANCHES QUE SE COMPARTEN, SOLO EN BRANCHES LOCALES.
git rebase master

# Copiar los cambios del branch server al final del branch master y hacer un commit.
git rebase master server

# Traer un commit en especifico al master (como un rebase pero trayendo un commit especifico).
git cherry-pick numero_de_commit_a_traer

# Generar un patch, compando el ultimo commit local vs el branch remoto.
# Esto crea archivos .patch con los cambios para ser aplicados en el repositorio remoto.
git format-patch .M origin/branch_remoto

# Aplicar un patch
# Esto no crea un commit, se debe pasar a stage y hacer commit.
# git apply se deberia usar solo para legacy patch, para nuevo patch
# se debe usar format-patch para generar el path y git am para aplicar el patch.
git apply /tmp/a___.patch

# Para aplicar un patch de un archivo generado con git format-parte_del_checksum_del_commit
# Este comando creara un commit.
git am 0001-limit-----.patch

# Si el comando git am marca conflicto se debe solucionar el conflicto, pasar el archivo a stage y
# ejecutar git am --resovled
git am --resolved

# Mostrar el tag anterior, seguido del nuemero de commites posteriores y el sha-1 del ultimo commit.
git describe master

# Crea un archivo con el codigo de la ultima version de un commit.
git archive master --prefix='project/' | `git describe master`.tar.gz

# Crear un archivo zip con el codigo fuente.
git archive master --prefix='project/' --format=zip > `git describe master`.zip

# Muestra un resumen por usuario de los ultimos commits no merges despues de la version v1.0.1
git shortlog --no-merges master --not v1.0.1


==================
# Cambio desde github.
# Cambio desde local......
