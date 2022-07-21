/*
  Warnings:

  - You are about to drop the `delivery_man` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `delivery_man`;

-- CreateTable
CREATE TABLE `deliveryman` (
    `id` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `deliveryman_username_key`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Deliveries` (
    `id` VARCHAR(191) NOT NULL,
    `item_name` VARCHAR(191) NOT NULL,
    `clientsId` VARCHAR(191) NOT NULL,
    `deliveryManId` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Deliveries` ADD CONSTRAINT `Deliveries_clientsId_fkey` FOREIGN KEY (`clientsId`) REFERENCES `clients`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Deliveries` ADD CONSTRAINT `Deliveries_deliveryManId_fkey` FOREIGN KEY (`deliveryManId`) REFERENCES `deliveryman`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
