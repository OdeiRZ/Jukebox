Jukebox 0.9
================================

Aplicación web que simula el funcionamiento de una rockola, reproduciendo música y elementos multimedia
(aún en modo beta, no está lista para producción). Desplegada en fase de pruebas unicamente en 
un equipo local.

Desde ella se podrán reproducir canciones agrupadas por géneros y álbumes, mostrando información perteneciente 
a los mismos, tales como portadas, años de producción, números y nombres de pistas, nombres de artistas, etc., 
añadiendo además efectos interactivos para una interacción con el usuario más satisfactoria.

Este proyecto utiliza PHP y su extensión [PDO], junto con algunas otras librerias en JavaScript que acompañan 
el proyecto.

Para facilitar el desarrollo se proporciona un entorno [Vagrant] con todas las dependencias ya instaladas.

## Requisitos
- PHP 5.1 o superior
- Servidor web Apache2 (podría funcionar con nginx, pero no se ha probado)
- Cualquier sistema gestor de bases de datos (p.ej. MySQL, MariaDB, PosgreSQL, SQLite, etc.)

## Entorno de desarrollo
Para poder ejecutar la aplicación en un entorno de desarrollo basta con tener [Vagrant] instalado junto con [VirtualBox]
y ejecutar el comando `vagrant up`. La aplicación será accesible desde la dirección http://192.168.33.10/

## Licencia
Esta aplicación se ofrece bajo licencia [GPL versión 3].

[Vagrant]: https://www.vagrantup.com/
[VirtualBox]: https://www.virtualbox.org
[PDO]: http://php.net/manual/es/book.pdo.php
[GPL versión 3]: https://www.gnu.org/licenses/gpl-3.0.en.html
