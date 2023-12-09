from users import models

print(
    models.TestTable.objects.raw(
        "select * \
        from TestTable"
    )
)