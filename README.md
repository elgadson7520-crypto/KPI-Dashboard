# Oklahoma City KPI Dashboard

Manufacturing KPI Dashboard for tracking machine performance metrics across weekly, monthly, quarterly, and yearly time periods.

## 🚀 Deploy to Vercel

### Method 1: GitHub + Vercel (Recommended)

1. **Create a GitHub repository**
   - Go to [github.com](https://github.com) and log in
   - Click the "+" icon → "New repository"
   - Name it: `kpi-dashboard`
   - Keep it Public or Private (your choice)
   - Click "Create repository"

2. **Upload files to GitHub**
   - On your new repository page, click "uploading an existing file"
   - Drag and drop ALL files from this folder:
     - `index.html`
     - `README.md`
     - `vercel.json`
     - `.gitignore`
   - Click "Commit changes"

3. **Deploy on Vercel**
   - Go to [vercel.com](https://vercel.com) and log in
   - Click "Add New..." → "Project"
   - Click "Import Git Repository"
   - Find your `kpi-dashboard` repository
   - Click "Import"
   - Click "Deploy"
   - Done! ✅

### Method 2: Vercel CLI

```bash
# Install Vercel CLI (one-time setup)
npm i -g vercel

# Navigate to this folder
cd path/to/kpi-dashboard-deploy

# Deploy
vercel

# Follow the prompts, then your dashboard is live!
```

### Method 3: Drag & Drop

1. Go to [vercel.com/new](https://vercel.com/new)
2. Drag this entire folder onto the Vercel window
3. Click "Deploy"

## 📊 Features

- **Multi-Period Views**: Weekly (52 weeks), Monthly (12 months), Quarterly (4 quarters), Yearly
- **KPI Cards**: Visual performance indicators with green/red status
- **Interactive Charts**: Line charts with CY Actual, Target, and PY comparison
- **Data Import**: 
  - Supports Production Efficiency reports (auto-parsed)
  - Supports structured KPI Excel templates
- **Data Entry**: Manual entry interface for all time periods
- **Export**: Download current view data as Excel

## 📁 File Structure

```
kpi-dashboard-deploy/
├── index.html          # Main dashboard (standalone, no dependencies)
├── README.md           # This file
├── vercel.json         # Vercel configuration
└── .gitignore          # Git ignore file
```

## 🎯 Usage

1. **Add Machines**: Click "Add Machine" button
2. **Enter Data**: Click "Enter Data" for any machine
3. **Import Data**: Click "Import" to upload Excel files
4. **Switch Views**: Toggle between Weekly/Monthly/Quarterly/Yearly
5. **Export Data**: Click "Export" to download current view

## 📤 Supported Import Formats

### Production Efficiency Reports
- Auto-detects "Production Efficiency - Summary" format
- Extracts: Setup Time, Downtime %, Feeds/RunHr, Utilization %, Efficiency %, Waste Qty
- Automatically assigns to weekly data based on report date range

### KPI Template (Excel)
- Sheets: `CY Actual Monthly`, `CY Target Monthly`, `PY Actual Monthly`
- Optional: Quarterly and Yearly sheets
- Optional: `KPIs Info` sheet for descriptions

## 🛠️ Technologies

- Pure HTML + CSS + JavaScript (no build step required)
- Chart.js for visualizations
- SheetJS for Excel import/export
- Fully client-side (no server required)

## 📝 Notes

- All data is stored in browser memory (not persistent)
- Refresh the page to reset to demo data
- For persistent storage, consider integrating with a backend API

## 🔗 Links

- Dashboard: Your Vercel URL will appear here after deployment
- GitHub: Your GitHub repository URL
- Support: Contact your IT department

---

Built with ❤️ for Oklahoma City Manufacturing
