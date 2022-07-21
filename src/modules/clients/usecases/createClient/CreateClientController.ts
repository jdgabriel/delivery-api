import { Request, Response } from "express";
import { CreateClient } from "./CreateClient";

export class CreateClientController {
  async handle(req: Request, res: Response) {
    const { username, password } = req.body;
    const createClient = new CreateClient();
    const result = await createClient.execute({ username, password });
    return res.json(result);
  }
}
