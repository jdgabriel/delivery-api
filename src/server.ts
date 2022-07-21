import Debug from "debug";
import "dotenv/config";
import express, { Request, Response } from "express";
import { routes } from "./routes";

const log = Debug("app:server");
const app = express();

app.get("/", (req: Request, res: Response) => {
  return res.json({ online: true });
});

app.use(routes);

const port = process.env.PORT || 3000;
app.listen(port, () => {
  log(`Server running at http://localhost:${port}`);
});
