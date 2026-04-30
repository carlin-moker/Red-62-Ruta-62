import chalk from 'chalk';

class Logger {
  constructor(context = 'RED-62') {
    this.context = context;
  }

  info(message) {
    console.log(chalk.blue(`[INFO] [${this.context}]`), message);
  }

  success(message) {
    console.log(chalk.green(`[SUCCESS] [${this.context}]`), message);
  }

  error(message, err = '') {
    console.log(chalk.red(`[ERROR] [${this.context}]`), message, err);
  }
}

export default Logger;

