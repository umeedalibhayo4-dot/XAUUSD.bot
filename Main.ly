import os
from telegram import Update, InlineKeyboardButton, InlineKeyboardMarkup
from telegram.ext import Application, CommandHandler, ContextTypes

BOT_TOKEN = os.environ.get("BOT_TOKEN")
FOLDER_LINK = os.environ.get("FOLDER_LINK", "YOUR_FOLDER_LINK_HERE")


async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    keyboard = [
        [InlineKeyboardButton("📂 Open Signals", url=FOLDER_LINK)]
    ]

    await update.message.reply_text(
        "Welcome to XAUUSD Plus 👋\n\n"
        "Click the button below to open the signals:",
        reply_markup=InlineKeyboardMarkup(keyboard)
    )


def main():
    if not BOT_TOKEN:
        raise ValueError("BOT_TOKEN is missing")

    app = Application.builder().token(BOT_TOKEN).build()
    app.add_handler(CommandHandler("start", start))

    app.run_polling()


if __name__ == "__main__":
    main()
