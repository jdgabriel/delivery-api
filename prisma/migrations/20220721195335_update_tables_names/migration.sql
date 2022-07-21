/*
  Warnings:

  - You are about to drop the `Deliveries` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Deliveries` DROP FOREIGN KEY `Deliveries_clientsId_fkey`;

-- DropForeignKey
ALTER TABLE `Deliveries` DROP FOREIGN KEY `Deliveries_deliveryManId_fkey`;

-- DropTable
DROP TABLE `Deliveries`;

-- CreateTable
CREATE TABLE `deliveries` (
    `id` VARCHAR(191) NOT NULL,
    `item_name` VARCHAR(191) NOT NULL,
    `clientsId` VARCHAR(191) NOT NULL,
    `deliveryManId` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `deliveries` ADD CONSTRAINT `deliveries_clientsId_fkey` FOREIGN KEY (`clientsId`) REFERENCES `clients`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `deliveries` ADD CONSTRAINT `deliveries_deliveryManId_fkey` FOREIGN KEY (`deliveryManId`) REFERENCES `deliveryman`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
