#include "AlertFilterType.h"
#include "ui_AlertFilterType.h"

AlertFilterType::AlertFilterType(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::AlertFilterType)
{
    ui->setupUi(this);
    ui->lFilterActive->setAttribute(Qt::WA_TransparentForMouseEvents);
    ui->bDropDownArrow->setAttribute(Qt::WA_TransparentForMouseEvents);
    ui->liconType->setAttribute(Qt::WA_TransparentForMouseEvents);
}

AlertFilterType::~AlertFilterType()
{
    delete ui;
}

void AlertFilterType::setActualFilter(int type)
{
    switch (type)
    {
        case TYPE_CONTACTS:
            {
                ui->liconType->setIcon(QIcon(QString::fromUtf8(":/images/contacts.png")).pixmap(6.0, 6.0));
                ui->liconType->show();
                ui->lFilterActive->setText(tr("Contacts"));
            }
            break;
        case TYPE_PAYMENTS:
            {
                ui->liconType->setIcon(QIcon(QString::fromUtf8(":/images/payments.png")).pixmap(6.0, 6.0));
                ui->liconType->show();
                ui->lFilterActive->setText(tr("Payment"));
            }
            break;
        case TYPE_SHARES:
            {
                ui->liconType->setIcon(QIcon(QString::fromUtf8(":/images/incoming_share.png")).pixmap(6.0, 6.0));
                ui->liconType->show();
                ui->lFilterActive->setText(tr("Incoming Shares"));
            }
            break;
        case ALL_TYPES:
        default:
            {
                ui->liconType->hide();
                ui->lFilterActive->setText(tr("All notifications"));
            }
            break;
    }
}

void AlertFilterType::mousePressEvent(QMouseEvent *event)
{
    emit clicked();
}
