﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class drDBEntities : DbContext
{
    public drDBEntities()
        : base("name=drDBEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<patient_demographics> patient_demographics { get; set; }
    public virtual DbSet<visit_information_tb> visit_information_tb { get; set; }
    public virtual DbSet<add_patient_tb> add_patient_tb { get; set; }
    public virtual DbSet<microbiology_tb> microbiology_tb { get; set; }
    public virtual DbSet<medication_tb> medication_tb { get; set; }
    public virtual DbSet<PFT_tb> PFT_tb { get; set; }
    public virtual DbSet<cxr_tb> cxr_tb { get; set; }
    public virtual DbSet<upload_tb> upload_tb { get; set; }
    public virtual DbSet<user> user { get; set; }
}