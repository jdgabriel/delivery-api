import { hash } from "bcrypt";
import { prisma } from "../../../../database/prismaCliente";

interface ICreateClient {
  username: string;
  password: string;
}

export class CreateClient {
  async execute({ username, password }: ICreateClient) {
    const clientExist = await prisma.clients.findFirst({
      where: { username },
    });

    if (clientExist) {
      throw new Error("Client already exists");
    }

    const hasPassword = await hash(password, 10);

    const client = await prisma.clients.create({
      data: {
        username,
        password: hasPassword,
      },
    });

    return client;
  }
}
