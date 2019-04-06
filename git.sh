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

# Mostrar cambios que NO estan en Stage.
git diff

# Mostrar los cambios que SI estan en Stage para commit.
git diff --staged
git diff --cached

# Mostrar el estatus de los archivos en el repositorio local con flags cortos.
# Los flags regresan en 2 columns: En Stage y en Working Directory.
git status -s
git status --short
#  M - Modified in working directory
# M  - Modified and in Staged
# ?? - files no Tracked
# A  - new Files in Stage
# MM - Modified and in Staged AND After Modified in working directory.
