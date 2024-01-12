-- CreateTable
CREATE TABLE "docente" (
    "id_docente" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "carnet" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "materia" (
    "id_materia" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "id_docente" INTEGER NOT NULL,
    CONSTRAINT "materia_id_docente_fkey" FOREIGN KEY ("id_docente") REFERENCES "docente" ("id_docente") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "alumno" (
    "id_alumno" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "carnet" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "periodo" (
    "id_periodo" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "comentario" TEXT NOT NULL,
    "promedio" DECIMAL NOT NULL,
    "parcial" DECIMAL NOT NULL,
    "actividad1" DECIMAL NOT NULL,
    "actividad2" DECIMAL NOT NULL,
    "id_alumno" INTEGER NOT NULL,
    "id_ciclo" INTEGER NOT NULL,
    CONSTRAINT "periodo_id_alumno_fkey" FOREIGN KEY ("id_alumno") REFERENCES "alumno" ("id_alumno") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "periodo_id_ciclo_fkey" FOREIGN KEY ("id_ciclo") REFERENCES "ciclo" ("id_ciclo") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ciclo" (
    "id_ciclo" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "promedio_ciclo" DECIMAL NOT NULL,
    "id_materia" INTEGER NOT NULL,
    CONSTRAINT "ciclo_id_materia_fkey" FOREIGN KEY ("id_materia") REFERENCES "materia" ("id_materia") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "docente_carnet_key" ON "docente"("carnet");

-- CreateIndex
CREATE UNIQUE INDEX "alumno_carnet_key" ON "alumno"("carnet");
