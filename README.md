Como podrán ver el proyecto está Dockerizado, para poder levantarlo primero deberían crear la db "development_db" en el contenedor de la base.

Me tomó aproximada mente unas 5 horas hacer el challenge. No conseguí instalar correctamente Tailwind, y después de darles muchas vueltas e intentar muchas cosas, desistí.

Hubieron cosas que me parecieron que se pueden mejorar, por ejemplo:

1) Por ahora no habría necesidad de crear el modelo "Banco" ya que no posee mucha información y cada vez que se crea un proveedor, estaríamos creando un banco nuevo. Distinto sería si hubieran preseleccionados algunos ya cargados, O incluso quizás lo mejor sería crear el modelo de cuenta, ya que serían todas distintas, y se podrían agrupar por nombre del banco y tener un índice con los proveedores, pero esa idea falla al ser opcional el número de cuenta bancaria.

2) La estética, después de intentar un buen rato con Tailwind, abandoné la idea de utilizar CSS, en otros proyectos he usado Bootstrap normalmente, pero quise avanzar con el ejercicio y no demorarlo más

3) Se debería crear formularios para la edición y agregado de Bancos. Que pasa si se editan los datos bancarios de un proveedor?, Y si se borra el mismo, Habría que borrar el modelo del Banco?