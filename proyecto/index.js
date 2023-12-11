import express from "express";
import mainRouter from "./routes/main.js";
const app = express();
const port = 3000;





app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use("", mainRouter);
// app.use("/user", userRouter);


app.get("/health", (req, res) => {
  res.send("I'M ALIVE");
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});