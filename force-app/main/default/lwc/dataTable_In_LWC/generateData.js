export default function generateData({ amountOfRecords }) {
    return [...Array(amountOfRecords)].map((_, index) => {
        return {
            name: `Name (${index})`,
            website: 'www.salesforcegyaan.com',
            amount: 100000,
            //phone: `${Math.floor(Math.random() * 9000000000) + 1000000000}`,
            phone:'7020694830',
            closeAt: new Date(
                Date.now() + 86400000 * Math.ceil(Math.random() * 20)
            ),
        };
    });
}