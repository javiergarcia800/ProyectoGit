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
